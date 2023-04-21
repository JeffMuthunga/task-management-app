import { useEffect, useState } from "react";
import ReactMarkdown from "react-markdown";
import { Link } from "react-router-dom";
import styled from "styled-components";
import { Box, Button } from "../styles";

function TaskList() {
  const [tasks, setTasks] = useState([]);

  useEffect(() => {
    fetch("/tasks")
      .then((r) => r.json())
      .then(setTasks);
  }, []);

  return (
    <Wrapper>
      {tasks.length > 0 ? (
        tasks.map((task) => (
          <Task key={task.id}>
            <Box>
              <h2>{task.name}</h2>
              <p>
                <em>Due Date: {task.due_date} </em>
                &nbsp;·&nbsp;
                <cite>By {task.user.email_address}</cite>
              </p>
              <p>{task.description}</p>
              <p>{task.status}</p>
            </Box>
          </Task>
        ))
      ) : (
        <>
          <h2>No Tasks Found</h2>
          <Button as={Link} to="/new">
            Make a New Task
          </Button>
        </>
      )}
    </Wrapper>
  );
}

const Wrapper = styled.section`
  max-width: 800px;
  margin: 40px auto;
`;

const Task = styled.article`
  margin-bottom: 24px;
`;

export default TaskList;
