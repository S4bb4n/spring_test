package com.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.daoapi.UsersDao;
import com.entities.Users;

@Repository
@Transactional
public class UsersImpl implements UsersDao{

	@Autowired
	SessionFactory sessionFactory;
	
	public boolean saveOrUpdate(Users users) {
		sessionFactory.getCurrentSession().saveOrUpdate(users);
		return true;
	}

	public List<Users> list() {
		
		return sessionFactory.getCurrentSession().createQuery("from Users").list();
	}

	public boolean delete(Users users) {
		try {
			sessionFactory.getCurrentSession().delete(users);
		}catch (Exception e) {
			return false;
		}
		return true;
	}
	

}
