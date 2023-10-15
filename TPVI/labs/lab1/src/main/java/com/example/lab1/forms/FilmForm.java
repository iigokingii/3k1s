package com.example.lab1.forms;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FilmForm {
	private int id;
	private String title;
	private String author;
}
