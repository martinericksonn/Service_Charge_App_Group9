import React from "react";
import {  useNavigate } from 'react-router-dom';


const LogIn = () =>{

    let navigate = useNavigate();

    function routeChange(){
        
    navigate("/Home");
    }
    



    return(
        <div className="cover">
            <h1>Log In</h1>
            <input type="text" placeholder="username"/>
            <input type="password" placeholder="password"/>
            &nbsp;   
                <button id = "login-btn" type="submit" onClick = {routeChange}>Log In</button>
        </div>
    )
}

export default LogIn