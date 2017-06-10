package controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import entity.Account;

public class TestEntity {

    @PersistenceContext
    EntityManager entityManager;

    public static void main(String[] args) {
        TestEntity testE = new TestEntity();
        List<Account> accounts = testE.getAccounts();
        System.out.println(accounts);
    }

    public List<Account> getAccounts() {
        return entityManager
                .createQuery("from Account", Account.class)
                .getResultList();
    }
}
