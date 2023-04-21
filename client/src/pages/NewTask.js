import { useState } from "react";
import { useNavigate } from 'react-router-dom';
import styled from "styled-components";
import ReactMarkdown from "react-markdown";
import { Button, Error, FormField, Input, Label, Textarea } from "../styles";

function NewTask({ user }) {
  const [name, setName] = useState("New Task");
  const [due_date, setDueDate] = useState("2023/08/01");
  const [description, setDescription] = useState(`Description goes here`);
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);

  const navigate = useNavigate()

  function handleSubmit(e) {
    e.preventDefault();
    setIsLoading(true);
    fetch("/recipes", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name,
        description,
        due_date: due_date,
      }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        navigate("/");
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

  return (
    <Wrapper>
      <WrapperChild>
        <h2>Create Recipe</h2>
        <form onSubmit={handleSubmit}>
          <FormField>
            <Label htmlFor="name">Name</Label>
            <Input
              type="text"
              id="name"
              value={name}
              onChange={(e) => setName(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="due_date">Due Date</Label>
            <Input
              type="number"
              id="due_date"
              value={due_date}
              onChange={(e) => setDueDate(e.target.value)}
            />
          </FormField>
          <FormField>
            <Label htmlFor="description">Description</Label>
            <Textarea
              id="description"
              rows="10"
              value={description}
              onChange={(e) => setDescription(e.target.value)}
            />
          </FormField>
          <FormField>
            <Button color="primary" type="submit">
              {isLoading ? "Loading..." : "Submit Recipe"}
            </Button>
          </FormField>
          <FormField>
            {errors.map((err) => (
              <Error key={err}>{err}</Error>
            ))}
          </FormField>
        </form>
      </WrapperChild>
      <WrapperChild>
        <h1>{name}</h1>
        <p>
          <em>Date: {due_date} minutes</em>
          &nbsp;·&nbsp;
          <cite>By {user.email_address}</cite>
        </p>
        <p>{description}</p>
      </WrapperChild>
    </Wrapper>
  );
}

const Wrapper = styled.section`
  max-width: 1000px;
  margin: 40px auto;
  padding: 16px;
  display: flex;
  gap: 24px;
`;

const WrapperChild = styled.div`
  flex: 1;
`;

export default NewTask;
