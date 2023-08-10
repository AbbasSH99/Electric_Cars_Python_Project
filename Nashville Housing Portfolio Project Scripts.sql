--Cleaning Data in SQL Queries

SELECT *
FROM PortfolioProject..NasvilleHousing


--Standarize Date Formate

SELECT SaleDateConverted, CONVERT(Date, SaleDate)
FROM PortfolioProject..NasvilleHousing

Update NasvilleHousing
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE NasvilleHousing
ADD SaleDateConverted Date

Update NasvilleHousing
SET SaleDateConverted = CONVERT(Date, SaleDate)


-----------------------------------------------------------------------------------------------------------------------------

--Populate Property Address Data

SELECT *
FROM PortfolioProject..NasvilleHousing
--WHERE PropertyAddress is null
ORDER BY ParcelID

SELECT a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM PortfolioProject..NasvilleHousing AS a
JOIN PortfolioProject..NasvilleHousing AS b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
WHERE a.PropertyAddress is null

UPDATE a
SET PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
FROM PortfolioProject..NasvilleHousing AS a
JOIN PortfolioProject..NasvilleHousing AS b
	ON a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]


------------------------------------------------------------------------------------------------------------------------

--Breaking Out Adress into Individual Columns (Adress, City, State)

SELECT PropertyAddress
FROM PortfolioProject..NasvilleHousing

SELECT SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) AS Adress
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN( PropertyAddress)) AS Adress
FROM PortfolioProject..NasvilleHousing


ALTER TABLE NasvilleHousing
ADD PropertySplitAddress nvarchar(255);

UPDATE NasvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)


ALTER TABLE NasvilleHousing
ADD PropertySplitCity nvarchar(255);

UPDATE NasvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN( PropertyAddress))





SELECT OwnerAddress
FROM NasvilleHousing

SELECT
PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)
, PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)
, PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
FROM NasvilleHousing


ALTER TABLE NasvilleHousing
ADD OwnerSplitAddress nvarchar(255);

UPDATE NasvilleHousing
SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)


ALTER TABLE NasvilleHousing
ADD OwnerSplitCity nvarchar(255);

UPDATE NasvilleHousing
SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)


ALTER TABLE NasvilleHousing
ADD OwnerSplitState nvarchar(255);

UPDATE NasvilleHousing
SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)


------------------------------------------------------------------------------------------------------------------------

--Change Y and N to Yes and No in "Sold as Vacant" field

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM PortfolioProject..NasvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2


SELECT SoldAsVacant
, CASE
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END
FROM PortfolioProject..NasvilleHousing


UPDATE NasvilleHousing
SET SoldAsVacant =
CASE
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END


----------------------------------------------------------------------------------------------------------------

--Remove Duplicates

WITH RowNumCTE AS(
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					[UniqueID ]
					) AS row_num
FROM PortfolioProject..NasvilleHousing
--ORDER BY ParcelID
)
DELETE
FROM RowNumCTE
WHERE row_num > 1
--ORDER BY PropertyAddress


-----------------------------------------------------------------------------------------------------------------------

--Delete Used Colums

SELECT *
FROM PortfolioProject..NasvilleHousing

ALTER TABLE PortfolioProject..NasvilleHousing
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress

ALTER TABLE PortfolioProject..NasvilleHousing
DROP COLUMN SaleDate