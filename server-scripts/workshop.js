let ignore = new Set(["ulx", "ulib", "server"]);

await navigator.clipboard.writeText(
  Array.from(document.querySelectorAll(".workshopItemTitle"))
    .map((i) => {
      const url = i.parentNode.href;
      if (url && !ignore.has(i.textContent.toLowerCase())) {
        return new URLSearchParams(new URL(url).search).get("id");
      }
      return null;
    })
    .filter((i) => i)
    .map((j) => `resource.AddWorkshop(${j})`)
    .join("\n")
);
