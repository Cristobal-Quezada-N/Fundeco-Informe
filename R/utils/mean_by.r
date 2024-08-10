mean_by <- function(df, val) {
    df_result <- df %>%
        group_by(across(all_of(val))) %>%
        summarise(across(everything(), \(x) round(mean(x, na.rm = TRUE), 0))) %>%
        as.data.frame()

    return(df_result)
}
