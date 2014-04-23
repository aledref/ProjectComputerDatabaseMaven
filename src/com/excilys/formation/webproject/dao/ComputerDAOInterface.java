package com.excilys.formation.webproject.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.excilys.formation.webproject.om.Company;
import com.excilys.formation.webproject.om.Computer;

/**
 * 
 * @author excilys
 *
 */
public interface ComputerDAOInterface{

	
	
	/**
	 * @return The Computer in the table computer matching the id
	 */
	public Computer findComputer(Long id);
	
	/**
	 * 
	 * @return A List<Computer> of Computer in the table computer
	 */
	public List getListComputer();

	/**
	 * 
	 * @return A List<Computer> of Computer in the table computer containing namefilter
	 */
	public List getListComputerWithName(String namefilter);
	
	/**
	 * 
	 * @param comp A Computer to be added in the table computer
	 */
	public void insertComputer(Computer comp);
	
	/**
	 * 
	 * @param comp A Computer to be edited in the table computer
	 * @param id The id of the edited Computer
	 */
	public void editComputer(Computer comp,Long id);
	
	/**
	 * 
	 * @param id The id of the Computer to be removed in the table computer
	 */
	public void removeComputer(Long id);
}