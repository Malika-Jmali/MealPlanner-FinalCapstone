package com.techelevator.controller;

import com.techelevator.dao.MealDAO;
import com.techelevator.dao.UserDAO;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
@RestController
@CrossOrigin
//@PreAuthorize("isAuthenticated()")

public class MealController {
    private MealDAO mealDAO;
    private UserDAO userDAO;

    public MealController(MealDAO mealDAO, UserDAO userDAO){
        this.mealDAO = mealDAO;
        this.userDAO = userDAO;
    }



    @RequestMapping(path = "/meals", method = RequestMethod.GET)
    public void getMeals(Principal principal) {
        principal.getName();
        int userId = userDAO.findIdByUsername(principal.getName());
        mealDAO.getMeals(userId);
    }
}
