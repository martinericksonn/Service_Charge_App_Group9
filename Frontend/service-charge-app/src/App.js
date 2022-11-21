import { useState } from 'react'; 
import './App.css';
import './loginform.css';
import TicketManagement from './Components/TicketManagement';
import Navbar from './Components/Navbar';
import TicketList from './pages/TicketList';
import NewTicket from './pages/NewTicket';
import Notification from './pages/Notification';
import Attachments from './pages/Attachments';
import ViewTicket from './pages/ViewTicket';
import {Route, Routes} from "react-router-dom"
import LoginForm from './Components/LoginForm';


function App() {
    const adminUser ={
        email: "admin@admin.com",
        password:"admin123"
    }
    const[user, setUser] = useState({name:"",email:""});
    const[error, setError] = useState("");

    const Login = details =>{
        console.log(details);

        if(details.email == adminUser.email && details.password == adminUser.password){
            console.log("Logged In!");
            setUser({
                name: details.name,
                email: details.email,
                password: details.password
            })
        }
        else{
            console.log("Does not match");
            setError("Details do not match!");  
        }

    }
    
    const Logout = () =>{
        setUser({name:"",email:""})
    }

    return ( 
        <>
        <div className='App'>
            {(user.email!="") ?(
                <div className='welcome'>
                    <h2> welcome, <span>{user.name}</span></h2>
                    <button onClick={Logout}>Logout</button>
                </div>
            ): (
                <LoginForm Login={Login} error={error}/>
            )}
        </div>
        <Navbar/> 
        <div className="container">
            <Routes>
                <Route path='/Home' element={<App/>}/>
                <Route path='/Ticket_List' element={<TicketList/>}/>
                <Route path='/New_Ticket' element={<NewTicket/>}/>
                <Route path='/Notification' element={<Notification/>}/>
                <Route path='/attach_Files' element={<Attachments/>}/>
                <Route path='/view_Tickets' element={<ViewTicket/>}/>
            </Routes>
        </div>
        </>
    );
}

export default App;