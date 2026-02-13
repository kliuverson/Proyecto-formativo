import { Wrench, Menu, X } from "lucide-react";
import { useState } from "react";

const navLinks = [
  { label: "Inicio", href: "#inicio" },
  { label: "Diagramas", href: "#diagramas" },
];

const Navbar = () => {
  const [open, setOpen] = useState(false);

  return (
    <header className="sticky top-0 z-40 w-full border-b border-border bg-card/80 backdrop-blur-md">
      <nav className="container mx-auto flex items-center justify-between h-14 px-4 sm:px-6">
        {/* Logo */}
        <a href="#inicio" className="flex items-center gap-2 text-foreground font-display font-semibold text-sm tracking-tight">
          <Wrench className="w-5 h-5 text-primary" />
          FerrematerialesDocs
        </a>

        {/* Desktop nav */}
        <ul className="hidden sm:flex items-center gap-6">
          {navLinks.map((link) => (
            <li key={link.href}>
              <a
                href={link.href}
                className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
              >
                {link.label}
              </a>
            </li>
          ))}
        </ul>

        {/* Mobile toggle */}
        <button
          className="sm:hidden p-2 text-muted-foreground hover:text-foreground"
          onClick={() => setOpen(!open)}
        >
          {open ? <X className="w-5 h-5" /> : <Menu className="w-5 h-5" />}
        </button>
      </nav>

      {/* Mobile menu */}
      {open && (
        <div className="sm:hidden border-t border-border bg-card px-4 py-3 animate-fade-in">
          {navLinks.map((link) => (
            <a
              key={link.href}
              href={link.href}
              onClick={() => setOpen(false)}
              className="block py-2 text-sm font-medium text-muted-foreground hover:text-foreground transition-colors"
            >
              {link.label}
            </a>
          ))}
        </div>
      )}
    </header>
  );
};

export default Navbar;
