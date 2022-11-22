
import axios, * as others from 'axios';
import React from "react";
const baseURL = "localhost:8080/ticket/all"
export default function TicketList(){
    const [post, setPost] = React.useState(null);

    React.useEffect(() => {
        axios.get(baseURL).then((response) => {
          setPost(response.data);
        });
      }, []);
    
      if (!post) return null;
    
      return (
        <div>
          <h1>{post.title}</h1>
          <p>{post.body}</p>
        </div>
      );
}