package com.dxc.dao.impl;

import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dxc.chain.StringUtil;
import com.dxc.dao.UserDao;
import com.dxc.entity.Role;
import com.dxc.entity.User;
import com.dxc.entity.UserRole;
import com.dxc.filter.UserCriteria;
import com.dxc.utils.StringUtils;

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

	@Override
	public User findOne(Long id) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(User.class, id);
	}

	@Override
	public Long save(User entity) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(entity);
		return entity.getId();
	}

	@Override
	public void update(User entity) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(entity);
	}

	@Override
	public Role findRoleById(Long id) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().get(Role.class, id);
	}

	@Override
	public Long save(UserRole entity) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(entity);
		return entity.getId();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Long countUser(UserCriteria criteria) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("");
		sql = new StringBuilder(" select Count(Distinct a.id) FROM User a where");
		if(!StringUtils.isNullOrEmpty(criteria.getEmail())) {
			sql.append(" email =: email");
		}
		if(!StringUtils.isNullOrEmpty(criteria.getIdentity())) {
			sql.append(" OR identity =: identity");
		}
		TypedQuery<Long> query = sessionFactory.getCurrentSession().createQuery(sql.toString());
		if(!StringUtils.isNullOrEmpty(criteria.getEmail())) {
			query.setParameter("email",criteria.getEmail());
		}
		if(!StringUtils.isNullOrEmpty(criteria.getIdentity())) {
			query.setParameter("identity",criteria.getIdentity());
		}
		return query.getSingleResult();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> findUserByCriteria(UserCriteria criteria) {
		// TODO Auto-generated method stub
		StringBuilder sql = new StringBuilder("");
		sql = new StringBuilder(" select a FROM User a where");
		if(!StringUtils.isNullOrEmpty(criteria.getEmail())) {
			sql.append(" email =: email");
		}
		if(!StringUtils.isNullOrEmpty(criteria.getIdentity())) {
			sql.append(" OR identity =: identity");
		}
		TypedQuery<User> query = sessionFactory.getCurrentSession().createQuery(sql.toString());
		if(!StringUtils.isNullOrEmpty(criteria.getEmail())) {
			query.setParameter("email",criteria.getEmail());
		}
		if(!StringUtils.isNullOrEmpty(criteria.getIdentity())) {
			query.setParameter("identity",criteria.getIdentity());
		}
		
		return query.getResultList();
	}

}
