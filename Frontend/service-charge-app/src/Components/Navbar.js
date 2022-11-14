import { Children } from "react"
import { Link, useMatch, useResolvedPath} from "react-router-dom"
export default function Navbar(){
    return (
        <nav className="nav">
        <Link to="/" className="site-title">Service Charge App</Link> 
        <ul>
            <CustomLink to="/ticket_List">Ticket List</CustomLink>
            <CustomLink to="/new_Ticket">New List</CustomLink>
            <CustomLink to="/Notification">Notification</CustomLink>
            <CustomLink to="/Attach_Files">Attachments</CustomLink>
            <CustomLink to="/View_Ticket">View Tickets</CustomLink>
        </ul>   
    </nav>
    )
}

function CustomLink({to, children, ...props }){
    const resolvedPath = useResolvedPath(to)
    const isActive = useMatch({path: resolvedPath.pathname, end:true})

    return(
        <li className={isActive ? "active" : ""}>
             <Link to={to} {...props}>
                {children}
            </Link>
        </li>
    )
}