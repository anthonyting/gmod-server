let ignoreMatch = new Set(["ulx", "ulib", "server", "mapvote"]);
let ignoreEqual = new Set([]);

await navigator.clipboard.writeText(
  Array.from(document.querySelectorAll(".workshopItemTitle"))
    .map((itemTitleElement) => {
      const url = itemTitleElement.parentNode.href;
      if (!url) {
        return null;
      }

      for (const item of ignoreMatch) {
        if (itemTitleElement.textContent.toLowerCase().includes(item)) {
          return null;
        }
      }
      for (const item of ignoreEqual) {
        if (itemTitleElement.textContent === item) {
          return null;
        }
      }
      return new URLSearchParams(new URL(url).search).get("id");;
    })
    .filter((i) => i)
    .map((j) => `resource.AddWorkshop(${j})`)
    .join("\n")
);
