package com.dxc.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dxc.dao.UserDao;
import com.dxc.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();

		List<User> list = session.createQuery("from User").list();

		return list;
	}

}
