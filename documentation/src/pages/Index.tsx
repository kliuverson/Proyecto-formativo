import { useState } from "react";
import { Layers, ArrowDown } from "lucide-react";
import Navbar from "@/components/Navbar";
import DiagramCard from "@/components/DiagramCard";
import DiagramModal from "@/components/DiagramModal";

import diagramUseCases from "@/assets/diagrama-casos-uso.png";
import diagramClasses from "@/assets/diagrama-clases.png";
import diagramArchitecture from "@/assets/diagram-architecture.png";
import diagramER from "@/assets/modelo-entidad-relacion.png";
import diagramSequence from "@/assets/diagrama-actividades.png";

const diagrams = [
  {
    image: diagramUseCases,
    title: "Diagrama de Casos de Uso",
    description: "Representa las interacciones entre los actores del sistema y los casos de uso principales.",
  },
  {
    image: diagramClasses,
    title: "Diagrama de Clases",
    description: "Muestra las clases del sistema, sus atributos, métodos y relaciones de herencia y asociación.",
  },
  {
    image: diagramArchitecture,
    title: "Arquitectura del Sistema",
    description: "Vista general de la arquitectura, incluyendo frontend, backend, API y servicios externos.",
  },
  {
    image: diagramER,
    title: "Diagrama Entidad-Relación",
    description: "Modelo de la base de datos con entidades, atributos, claves primarias y relaciones.",
  },
  {
    image: diagramSequence,
    title: "Diagrama de Actividades",
    description: "Representa el flujo de acciones y decisiones del sistema, mostrando cómo se desarrollan los procesos desde el inicio hasta su finalización.",
  },

];

const Index = () => {
  const [modal, setModal] = useState<{ image: string; title: string } | null>(null);

  return (
    <div className="min-h-screen bg-background">
      <Navbar />

      {/* Hero */}
      <section id="inicio" className="container mx-auto px-4 sm:px-6 pt-20 pb-16 text-center">
        <div className="inline-flex items-center gap-2 rounded-full bg-doc-highlight-soft px-4 py-1.5 mb-6">
          <Layers className="w-4 h-4 text-primary" />
          <span className="text-xs font-display font-medium text-primary">Documentación Técnica</span>
        </div>

        <h1 className="font-display text-3xl sm:text-4xl md:text-5xl font-bold text-foreground tracking-tight leading-tight mb-4">
          Ferremateriales DGC
        </h1>
        <p className="max-w-2xl mx-auto text-base sm:text-lg text-muted-foreground font-body leading-relaxed mb-8">
          Documentación completa del sistema de software, incluyendo diagramas UML,
          arquitectura, modelo de datos y flujos de interacción entre componentes.
        </p>

        <a
          href="#diagramas"
          className="inline-flex items-center gap-2 rounded-lg bg-primary px-5 py-2.5 text-sm font-display font-medium text-primary-foreground hover:bg-primary/90 transition-colors"
        >
          Ver diagramas
          <ArrowDown className="w-4 h-4" />
        </a>
      </section>

      {/* Divider */}
      <div className="container mx-auto px-4 sm:px-6">
        <div className="h-px bg-border" />
      </div>

      {/* Diagrams Grid */}
      <section id="diagramas" className="container mx-auto px-4 sm:px-6 py-16">
        <div className="mb-10">
          <h2 className="font-display text-xl sm:text-2xl font-bold text-foreground tracking-tight mb-2">
            Diagramas del Sistema
          </h2>
          <p className="text-sm text-muted-foreground font-body">
            Haz clic en cualquier diagrama para verlo en tamaño completo.
          </p>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {diagrams.map((d, i) => (
            <DiagramCard
              key={d.title}
              image={d.image}
              title={d.title}
              description={d.description}
              index={i}
              onExpand={() => setModal({ image: d.image, title: d.title })}
            />
          ))}
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-border py-8">
        <div className="container mx-auto px-4 sm:px-6 text-center">
          <p className="text-xs text-muted-foreground font-body">
            Documentación generada para el proyecto · {new Date().getFullYear()}
          </p>
        </div>
      </footer>

      {/* Modal */}
      {modal && (
        <DiagramModal
          isOpen={!!modal}
          onClose={() => setModal(null)}
          image={modal.image}
          title={modal.title}
        />
      )}
    </div>
  );
};

export default Index;
