package com.techelevator.controller;
//
import com.techelevator.dao.MealDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.Meal;
import com.techelevator.model.Recipe;
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

import javax.validation.Valid;


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
    public List<Meal> getMeals(Principal principal) {
        int userId = userDAO.findIdByUsername(principal.getName());
        return mealDAO.getMeals(userId);
    }

    @RequestMapping(path = "/recipes", method = RequestMethod.GET)
    public List<Recipe> getRecipes(Principal principal) {
        int userId = userDAO.findIdByUsername(principal.getName());
        return mealDAO.getRecipes(userId);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/meals", method = RequestMethod.POST)
    public void addMeal(@Valid @RequestBody Meal meal, Principal principal) {
        int userId = userDAO.findIdByUsername(principal.getName());
        mealDAO.addMeal(userId, meal);
    }

    @RequestMapping(path = "/mealPlanDetails/{id}", method = RequestMethod.GET)
    public Meal getMeals(@PathVariable Integer id) {
        return mealDAO.retrieveMealByID(id);
    }


    @RequestMapping(path = "/deleteMeals/{id}", method = RequestMethod.DELETE)
    public void deleteMealPlanById(@PathVariable Integer id) {
        mealDAO.deleteMealPlanById(id);
    }


    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/updateMeals", method = RequestMethod.PUT)
    public void updateMealPlan(@Valid @RequestBody Meal meal) {
        mealDAO.updateMealPlanById(meal);
    }
}
