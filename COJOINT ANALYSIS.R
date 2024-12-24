library(conjoint)

# Suppress warnings
options(warn=-1)

# Set seed for reproducibility
set.seed(1)

# Define attribute levels
attrib.level <- list(
  brand = c("CR", "Apple", "Samsung", "FitBit"),
  ship = c("$0", "$10", "$20"),
  restock = c("0%", "5%", "10%", "15%"),
  retdays = c("7 days", "14 days", "21 days"),
  price = c("$150", "$200", "$250", "$300")
)

# Create the fractional factorial design
experiment <- expand.grid(attrib.level)
design <- caFactorialDesign(data=experiment, type="fractional", cards=30, seed=1)
print(cor(caEncodedDesign(design)))

# Load preferences data
pref <- read.csv("C:/Users/ankuv/Downloads/conjoint_preferences.csv")

# Prepare attribute vector
attrib.vector <- data.frame(unlist(attrib.level, use.names = FALSE))
colnames(attrib.vector) <- c("levels")

# Initialize part worths
part.worths <- NULL

# Loop through preferences
for (i in 1:ncol(pref)) {
  temp <- caPartUtilities(pref[,i], design, attrib.vector)
  
  # Define baseline cases
  Base_Brand <- temp[,"CR"]
  Base_Ship <- temp[,"$0"]
  Base_Restock <- temp[,"0%"]
  Base_Retdays <- temp[,"7 days"]
  Base_Price <- temp[,"$150"]
  
  # Adjust intercept
  temp[,"intercept"] <- temp[,"intercept"] - Base_Brand - Base_Ship - Base_Restock - Base_Retdays - Base_Price
  
  # Adjust coefficients
  L1 <- length(attrib.level$brand) + 1
  for (j in 2:L1) {
    temp[,j] <- temp[,j] - Base_Brand
  }
  
  L2 <- L1 + length(attrib.level$ship) - 1
  for (j in (L1+1):L2) {
    temp[,j] <- temp[,j] - Base_Ship
  }
  
  L3 <- L2 + length(attrib.level$restock) - 1
  for (j in (L2+1):L3) {
    temp[,j] <- temp[,j] - Base_Restock
  }
  
  L4 <- L3 + length(attrib.level$retdays) - 1
  for (j in (L3+1):L4) {
    temp[,j] <- temp[,j] - Base_Retdays
  }
  
  L5 <- L4 + length(attrib.level$price) - 1
  for (j in (L4+1):L5) {
    temp[,j] <- temp[,j] - Base_Price
  }
  
  part.worths <- rbind(part.worths, temp)
}

# Display the part worths
print(part.worths)

rownames(part.worths) <- colnames(pref) 
write.csv(part.worths, file="C:/Users/ankuv/Downloads/conjoint_ partworths.csv ", row.names=FALSE)