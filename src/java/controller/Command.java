/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Addson Coutinho <addsoncoutinho@hotmail.com>
 */
public interface Command {
    String execute(HttpServletRequest request ,HttpServletResponse response) throws Exception;
}
