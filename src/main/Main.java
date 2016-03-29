// code source: http://www.vogella.com/tutorials/JavaPersistenceAPI/article.html
package main;

//import static org.junit.Assert.assertTrue;

import javax.persistence.*;

import model.*;

public class Main {

	private static final String PERSISTENCE_UNIT_NAME = "QUIZ";
	private static EntityManagerFactory factory;

	public static void main(String[] args) {

		factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		EntityManager em = factory.createEntityManager();

		em.getTransaction().begin();

		Query q = em.createQuery("select m from User m");

		boolean createNewEntries = (q.getResultList().size() == 0);

		if (createNewEntries) {
			User user = new User();
			user.setName("David");
			user.setEmail("dnovodchuk@myseneca.ca");
			user.setPassword("123456");
			user.setRole(1);
			em.persist(user);
		}

		em.getTransaction().commit();

		em.close();
	}
}