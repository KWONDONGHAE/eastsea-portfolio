package com.mycom.app;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	@Autowired
	DataSource dataSource;

	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Model model, @RequestParam(value = "gubun", defaultValue = "first") String gubun,
			@RequestParam(value = "pageCounts", defaultValue = "0") int pageCounts,
			@RequestParam(value = "currentPage", defaultValue = "0") int currentPage,
			@RequestParam(value = "displayItems", defaultValue = "3") int displayItems) throws SQLException {
		
		Connection conn = dataSource.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		int recordsToDisplay;

		if (displayItems > 3) {
			recordsToDisplay = displayItems;
		} else {
			recordsToDisplay = displayItems;
		}

		int totalRecordCounts = 0;

		String sql = "";

		if (gubun.equals("first")) {
			sql = "select Count(*) as counts from board";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery(sql);

			if (rs.next()) {
				totalRecordCounts = rs.getInt("counts");
			}
			currentPage = 0;
			
			pageCounts = (int) Math.ceil((double) totalRecordCounts / (double) recordsToDisplay);

		} else if (gubun.equals("previous")) {
			if (currentPage != 0) {
				currentPage -= 1;
			}

		} else if (gubun.equals("next")) {

			currentPage += 1;
			if (currentPage == pageCounts) {
				currentPage -= 1;
			}

		} else if (gubun.equals("last")) {

			currentPage = pageCounts - 1;
		}

		int startLimit = currentPage * recordsToDisplay;
		int recordCountsToDisplay = recordsToDisplay;

		sql = "select * from board order by id desc limit " + startLimit + "," + recordCountsToDisplay;
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);

		List<Board> boardList = new ArrayList<Board>();
		while (rs.next()) {
			int id = rs.getInt("id");
			String title = rs.getString("title");
			String content_type = rs.getString("content_type");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			Board board = new Board(id, title, null, null, content_type, author, created_date);
			boardList.add(board);
		}
		conn.close();
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageCounts", pageCounts);
		model.addAttribute("displayItems", displayItems);
		model.addAttribute("boardList", boardList);

		return "board_list";
	}

	@RequestMapping(value = "/board_add", method = RequestMethod.GET)
	public String board_add(Model model) {
		model.addAttribute("boardform", new BoardForm());
		return "board_add";
	}

	@RequestMapping(value = "/board_add_process", method = RequestMethod.POST)
	public String board_add_process(Model model, @RequestParam("title") String title,
			@RequestParam("message") String message, @RequestParam("photo") MultipartFile photo,
			Authentication authentication, @Valid @ModelAttribute("boardform") BoardForm boardform,
			BindingResult bindingResult) throws SQLException, IOException {

		if (bindingResult.hasErrors()) {
			return "board_add";
		} else {
			String currentPrincipalName = authentication.getName();
			Connection conn = null;

			conn = dataSource.getConnection();
			PreparedStatement ps = null;
			ps = conn.prepareStatement("INSERT INTO board VALUES(default, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, title);
			ps.setString(2, message);
			InputStream is = null;
			if (!photo.isEmpty()) {
				is = photo.getInputStream();
				ps.setBlob(3, is);

				String contentType = photo.getContentType();

				ps.setString(4, contentType);
			} else {
				ps.setBlob(3, is);
				ps.setString(4, null);
			}

			ps.setString(5, currentPrincipalName);

			Timestamp timestamp = new Timestamp(new Date().getTime());
			ps.setTimestamp(6, timestamp);

			ps.executeUpdate();
			model.addAttribute("gubun", "추가");
			conn.close();

			return "board_process_result";

		}

	}

	@RequestMapping(value = "/board_details", method = RequestMethod.GET)
	public String board_details(Model model, @RequestParam("id") int id) throws SQLException {
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();

		Board board = null;
		if (rs.next()) {

			String title = rs.getString("title");
			String message = rs.getString("message");
			Blob photo = rs.getBlob("photo");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			board = new Board(id, title, message, photo, null, author, created_date);
		}

		conn.close();

		model.addAttribute("board", board);

		return "board_details";
	}

	@RequestMapping(value = "/board_edit", method = RequestMethod.GET)
	public String board_edit(Model model, @RequestParam("id") int id) throws Exception {
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();

		Board board = null;
		if (rs.next()) {

			String title = rs.getString("title");
			String message = rs.getString("message");
			Blob photo = rs.getBlob("photo");
			String contentType = rs.getString("content_type");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			board = new Board(id, title, message, photo, contentType, author, created_date);
		}

		conn.close();

		model.addAttribute("board", board);

		return "board_edit";

	}

	@RequestMapping(value = "/board_edit_process", method = RequestMethod.POST)
	public String board_edit_process(Model model, @RequestParam("title") String title,
			@RequestParam("message") String message, @RequestParam("author") String author,
			@RequestParam("photo") MultipartFile photo, @RequestParam("id") int id) throws Exception {

		String sql;
		if (photo.isEmpty()) {
			sql = "update board set title=?, message=?, author=? where id = ?";
		} else {
			sql = "update board set title=?, message=?, photo=?, content_type=?, author=? where id = ?";
		}
		Connection conn = dataSource.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setString(1, title);
		ps.setString(2, message);

		if (photo.isEmpty()) {
			ps.setString(3, author);
			ps.setInt(4, id);
		} else {
			InputStream is = photo.getInputStream();
			ps.setBlob(3, is);

			String contentType = photo.getContentType();

			ps.setString(4, contentType);

			ps.setString(5, author);
			ps.setInt(6, id);
		}

		int result = ps.executeUpdate();
		if (result > 0) {
			model.addAttribute("gubun", "수정");
			return "board_process_result";
		} else {

			return "board_edit";
		}

	}
	@RequestMapping(value = "/board_delete", method = RequestMethod.GET)
	public String board_delete(Model model, @RequestParam("id") int id) throws Exception{
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);

		ResultSet rs = ps.executeQuery();

		Board board = null;
		if (rs.next()) {

			String title = rs.getString("title");
			String message = rs.getString("message");
			Blob photo = rs.getBlob("photo");
			String contentType = rs.getString("content_type");
			String author = rs.getString("author");
			Date created_date = rs.getDate("created_date");

			board = new Board(id, title, message, photo, contentType, author, created_date);
		}

		conn.close();

		model.addAttribute("board", board);

		return "board_delete";
	}
	
	@RequestMapping(value = "/board_delete_process", method = RequestMethod.POST)
	public String board_delete_process(Model model, @RequestParam("id") int id) throws Exception {
		Connection conn = dataSource.getConnection();
		String sql = "delete from board where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		int result = ps.executeUpdate();

		if (result > 0) {
			model.addAttribute("gubun", "삭제");
			return "board_process_result";
		} else {
			return "redirect:/board_list";
		}
	}

	@RequestMapping(value = "/get_image", method = RequestMethod.GET)
	public void get_image(@RequestParam("id") int id, HttpServletResponse response) throws SQLException, IOException {
		Connection conn = dataSource.getConnection();
		String sql = "select * from board where id = ?";

		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			Blob blob = rs.getBlob("photo");
			String contentType = rs.getString("content_type");
			byte byteArray[] = blob.getBytes(1, (int) blob.length());
			response.setContentType(contentType);

			OutputStream os = response.getOutputStream();
			os.write(byteArray);
			os.flush();
			os.close();
		}
	}
}
