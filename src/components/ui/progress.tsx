"use client";

import * as React from "react";
import { cn } from "../../lib/utils";

interface ProgressProps {
  value?: number;
  className?: string;
  max?: number;
}

function Progress({
  value = 0,
  className,
  max = 100,
  ...props
}: ProgressProps) {
  const percentage = Math.min(Math.max((value / max) * 100, 0), 100);

  return (
    <div
      role="progressbar"
      aria-valuemin={0}
      aria-valuemax={max}
      aria-valuenow={value}
      className={cn(
        "relative h-2 w-full overflow-hidden rounded-full bg-secondary",
        className
      )}
      {...props}
    >
      <div
        className="h-full w-full flex-1 bg-primary transition-all duration-300 ease-in-out"
        style={{
          transform: `translateX(-${100 - percentage}%)`,
        }}
      />
    </div>
  );
}

export { Progress };