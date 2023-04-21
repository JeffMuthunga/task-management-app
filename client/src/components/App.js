import React, { useEffect, useState } from "react";
import { Switch, Route, Routes, Navigate } from "react-router-dom";
import NavBar from "./NavBar";
import Login from "../pages/Login";
import RecipeList from "../pages/TaskList";
import NewRecipe from "../pages/NewTask";

function App() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    // auto-login
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
      }
    });
  }, []);

  if (!user) return <Login onLogin={setUser} />;

  return (

    <>
    <NavBar user={user} setUser={setUser}/>
    <Routes>
      <Route path="/" element={<RecipeList/>}/>
      <Route path="/new" element={<NewRecipe/>}/>
    </Routes>
    </>
  );
}

export default App;
