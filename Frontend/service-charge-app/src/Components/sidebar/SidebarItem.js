import { useState } from "react"

export default function SidebarItem({item}){
    const [open, setOpen] = useState(false)
   
    if(item.childrens){
         return(
        <div className={open ? "sidebar-item open" :"sidebar-item"}>

            <div className="sidebar-title">
                <span>
                    <i className="bi-gear"></i>
                    {item.title}
                </span>
                <i className="bi-chevron-down toggle-btn" onClick={() => setOpen (!open)}>something
                </i>
            </div>


        </div>
    )
    }
    else{
        return(
            <div className="sidebar-item">
                <div className="sidebar-title">
                    <span>
                    <i className="bi-gear"></i>
                    {item.title}
                    </span>
                </div>

            </div>
        )
    }
}