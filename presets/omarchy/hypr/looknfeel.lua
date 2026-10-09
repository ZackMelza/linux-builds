-- Change the default Omarchy look'n'feel.

-- Compact spacing and softly rounded window corners.
hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 6,
    col = {
      active_border = { colors = { "rgba(d9e3e8ee)", "rgba(456b87ee)" }, angle = 45 },
      inactive_border = "rgba(53636daa)",
    },
  },

  decoration = {
    rounding = 8,
  },
})
