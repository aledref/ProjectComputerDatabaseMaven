package com.excilys.formation.webproject.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.excilys.formation.webproject.om.Company;

/**
 * 
 * @author excilys
 *
 */
public interface CompanyDAO{

	/**
	 * @return The Company in the table company matching the id
	 */
	public Company findById(Long id);
	
	/**
	 * @return The Company in the table company matching the name
	 */
	public Company findByName(String name);
	
	/**
	 * 
	 * @param rs The ResulSet from the query on the database computer-database-db
	 * @return A List of Company
	 */
	public List extractFromResultSet(ResultSet rs) throws SQLException;
	
	/**
	 * 
	 * @return A List<Company> of Company in the table company
	 */
	public List getList();

	/**
	 * 
	 * @param comp A Company to be added in the table company
	 */
	public void insert(Company comp);
}