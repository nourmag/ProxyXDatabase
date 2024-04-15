package com.proxy.core;

import java.util.List;

public interface BookDao {
	List<Book> getAllBooks() throws Exception;
}
