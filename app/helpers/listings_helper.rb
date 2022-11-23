# frozen_string_literal: true

module ListingsHelper
  def rounding_classes(index)
    rounding_classes = ["row-span-1 col-span-2  hidden md:block overflow-clip",
                           "rounded-tr-lg row-span-1 col-span-2  hidden md:block overflow-clip",
                           "row-span-1 col-span-2  hidden md:block overflow-clip",
                           "rounded-br-lg row-span-1 col-span-2  hidden md:block overflow-clip"]
    rounding_classes[index]
  end

  def heart_svg_path_d
    "M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12z"
  end

  def header_buttons_classes(color, intensity)
    "flex p-2 rounded-lg hover:bg-#{ color }-#{ intensity } text-sm transition duration-300 ease-in-out"
  end
end
