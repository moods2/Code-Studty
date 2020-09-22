package com.test.spring;

import org.springframework.beans.factory.annotation.Autowired;

@org.springframework.stereotype.Service
public class Service implements IService{ 

	@Autowired
	private DAO dao;

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return dao.getCount();
	}
	
	
	
}
