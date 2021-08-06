package com.techelevator.controller;
//
import com.techelevator.dao.MealDAO;
import com.techelevator.dao.UserDAO;
import org.springframework.http.HttpStatus;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
//import org.springframework.web.bind.annotation.CrossOrigin;
//
import java.security.Principal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;




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
        int userId = userDAO.findIdByUsername(principal.getName());
        mealDAO.getMeals(userId);
    }
}
