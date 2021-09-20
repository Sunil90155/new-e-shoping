package com.learn.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import com.learn.mycart.entities.User;

public class UserDao {

	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// method get user by email and password

	public User getUserByEmailAndUserPassword(String email, String password) {
		User user = null;
		try {
			String query = "from User where userEmail =: e and userPassword=: p ";
			Session session = this.factory.openSession();
			Query q = session.createQuery(query);
			q.setParameter("e", email);
			q.setParameter("p", password);

			user = (User) q.uniqueResult();
			session.close();

		} catch (Exception e) {
		}
		return user;
	}

// creating oder For payment


}