import type { Route } from "./+types/home";
import { desc } from "drizzle-orm";
import { getDb } from "../../db/client";
import { todos } from "../../db/schema";
import { Welcome } from "../welcome/welcome";

export function meta({}: Route.MetaArgs) {
  return [
    { title: "New React Router App" },
    { name: "description", content: "Welcome to React Router!" },
  ];
}

export async function loader({ context }: Route.LoaderArgs) {
  const db = getDb(context.cloudflare.env.DB);
  const recentTodos = await db
    .select({
      id: todos.id,
      title: todos.title,
      completed: todos.completed,
    })
    .from(todos)
    .orderBy(desc(todos.createdAt))
    .limit(5);

  return {
    message: context.cloudflare.env.VALUE_FROM_CLOUDFLARE,
    todos: recentTodos,
  };
}

export default function Home({ loaderData }: Route.ComponentProps) {
  return <Welcome message={loaderData.message} todos={loaderData.todos} />;
}
