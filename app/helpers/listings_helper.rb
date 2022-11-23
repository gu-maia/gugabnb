# frozen_string_literal: true

module ListingsHelper
  def rounding_classes(index)
    rounding_classes = ["row-span-1 col-span-2  hidden md:block overflow-clip",
                           "rounded-tr-lg row-span-1 col-span-2  hidden md:block overflow-clip",
                           "row-span-1 col-span-2  hidden md:block overflow-clip",
                           "rounded-br-lg row-span-1 col-span-2  hidden md:block overflow-clip"]
    rounding_classes[index]
  end
end
