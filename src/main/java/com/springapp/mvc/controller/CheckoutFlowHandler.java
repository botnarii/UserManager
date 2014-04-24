package com.springapp.mvc.controller;


import org.springframework.stereotype.Component;
import org.springframework.webflow.core.FlowException;
import org.springframework.webflow.execution.FlowExecutionOutcome;
import org.springframework.webflow.execution.repository.NoSuchFlowExecutionException;
import org.springframework.webflow.mvc.servlet.AbstractFlowHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class CheckoutFlowHandler extends AbstractFlowHandler {

    /**
     * Where the flow should go when it ends.
     */
    @Override
    public String handleExecutionOutcome(FlowExecutionOutcome outcome, HttpServletRequest request, HttpServletResponse response) {
        return getContextRelativeUrl("/home");
    }

    /**
     * Where to redirect if there is an exception not handled by the flow.
     */
    @Override
    public String handleException(FlowException e, HttpServletRequest request, HttpServletResponse response) {
        if (e instanceof NoSuchFlowExecutionException) {
            return getContextRelativeUrl("/home");
        } else {
            throw e;
        }
    }

    /**
     * Gets context relative url with an '.html' extension.
     */
    private String getContextRelativeUrl(String view) {
        return "contextRelative:" + view + ".html";
    }
}
