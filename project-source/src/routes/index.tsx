import { createFileRoute } from "@tanstack/react-router";
import { useEffect } from "react";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Sonderra — Personalized Travel Planning" },
      { name: "description", content: "Discover your travel DNA and plan personalized trips with Sonderra." },
      { property: "og:title", content: "Sonderra — Personalized Travel Planning" },
      { property: "og:description", content: "Discover your travel DNA and plan personalized trips with Sonderra." },
    ],
  }),
  component: Index,
});

function Index() {
  useEffect(() => {
    window.location.replace("/sonderra.html");
  }, []);
  return (
    <div className="flex min-h-screen items-center justify-center" style={{ backgroundColor: "#fcfbf8" }}>
      <p style={{ fontFamily: "system-ui", color: "#666" }}>Loading Sonderra…</p>
    </div>
  );
}
