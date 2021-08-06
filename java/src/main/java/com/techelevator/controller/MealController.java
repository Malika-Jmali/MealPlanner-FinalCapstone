package com.techelevator.controller;

import com.techelevator.dao.MealDAO;
import com.techelevator.dao.UserDAO;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.security.Principal;

@PreAuthorize("isAuthenticated()")
public class MealController {
    private MealDAO mealDAO;
    private UserDAO userDAO;

    public MealController(MealDAO mealDAO, UserDAO userDAO){
        this.mealDAO = mealDAO;
        this.userDAO = userDAO;
    }


    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/meals", method = RequestMethod.GET)
    public void getAllMeals(Principal principal) {
        principal.getName();


        int userId = userDAO.findIdByUsername(principal.getName());



        mealDAO.getAllMeals(userId);
    }
}
