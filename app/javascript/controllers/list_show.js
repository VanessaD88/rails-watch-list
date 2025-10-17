document.addEventListener("DOMContentLoaded", () => {
  const openBtn = document.getElementById("open-form");
  const closeBtn = document.getElementById("close-form");
  const overlay = document.getElementById("form-overlay");

  if (!openBtn) return;

  openBtn.addEventListener("click", () => {
    overlay.classList.remove("hidden");
  });

  closeBtn.addEventListener("click", () => {
    overlay.classList.add("hidden");
  });

  overlay.addEventListener("click", (e) => {
    if (e.target === overlay) overlay.classList.add("hidden");
  });
});
