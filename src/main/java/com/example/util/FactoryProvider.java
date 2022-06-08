package com.example.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
private static SessionFactory factory;
	
	public static SessionFactory getFactory() {
		if (factory == null) {
			Configuration cfg = new Configuration();
			cfg.configure("com/example/resources/hibernate.cfg.xml");
			factory = cfg.buildSessionFactory();
		}
		return factory;
	}
	
	public static void close() {
		factory.close();
	}
}
