import { Expand } from "lucide-react";

interface DiagramCardProps {
  image: string;
  title: string;
  description: string;
  onExpand: () => void;
  index: number;
}

const DiagramCard = ({ image, title, description, onExpand, index }: DiagramCardProps) => {
  return (
    <div
      className="group rounded-lg border border-border bg-card overflow-hidden transition-all duration-300 hover:shadow-lg hover:border-primary/30 opacity-0 animate-fade-in"
      style={{ animationDelay: `${index * 100}ms` }}
    >
      {/* Image preview */}
      <div className="relative overflow-hidden bg-doc-surface">
        <img
          src={image}
          alt={title}
          className="w-full h-48 object-cover transition-transform duration-500 group-hover:scale-105"
        />
        <div className="absolute inset-0 bg-foreground/0 group-hover:bg-foreground/5 transition-colors duration-300" />
      </div>

      {/* Content */}
      <div className="p-5">
        <h3 className="font-display text-sm font-semibold text-foreground mb-2 tracking-tight">
          {title}
        </h3>
        <p className="font-body text-sm text-muted-foreground leading-relaxed mb-4">
          {description}
        </p>
        <button
          onClick={onExpand}
          className="inline-flex items-center gap-2 text-sm font-medium text-primary hover:text-primary/80 transition-colors font-display"
        >
          <Expand className="w-4 h-4" />
          Ver en tamaño completo
        </button>
      </div>
    </div>
  );
};

export default DiagramCard;
