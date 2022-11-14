import { Children } from "react"

export default function Navbar(){
    return (
        <nav className="nav">
        <a href="/" className="site-title">Service Charge App</a> 
        <ul>
            <CustomLink href="/Ticket_List">Ticket List</CustomLink>
            <CustomLink href="/New_Ticket">New List</CustomLink>
            <CustomLink href="/Notification">Notification</CustomLink>
            <CustomLink href="/Attach_Files">Attachments</CustomLink>
            <CustomLink href="/View_Ticket">View Tickets</CustomLink>
        </ul>   
    </nav>
    )
}

function CustomLink({href, children, ...props }){
    const path = window.location.pathname

    return(
        <li className={path === href ? "active" : ""}>
             <a href={href} {...props}>
                {children}
            </a>
        </li>
    )
}