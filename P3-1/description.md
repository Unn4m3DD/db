ver https://github.com/Unn4m3DD/db/blob/master/P3-1/description.md
# a)
**Client**(nif, name, address, license_number)

**Rental**(id, duration, date, client_nif, counter_id, object_plate)

**Counter**(id, name, address)

**Vehicle**(plate, year, brand, vehicle_type_code)

**VehicleType**(code, designation, ac)

**Similarity**(vehicle_type_code_a, vehicle_type_code_b)

**Light**(code, seat_count, door_count, fuel_type)

**Heavy**(code, weight, passenger_count)

# b)

## **Client**(nif, name, address, license_number)  
foreign: {  }  
candidate: { { nif }, { license_number } }  
primary: { nif }  

## **Rental**(id, duration, date, client_nif, counter_id, object_plate)  
foreign: { { client_nif }, { counter_id }, { object_plate } }  
candidate: { { id } }  
primary: { id }  

## **Counter**(id, name, address)  
foreign: {  }  
candidate: { { id }, { address } }  
primary: { id }  

## **Vehicle**(plate, year, brand, vehicle_type_code)  
foreign: { { vehicle_type_code } }  
candidate: { { plate } }  
primary: { plate }

## **VehicleType**(code, designation, ac)  
foreign: {  }  
candidate: { { code } }  
primary: { code }  

## **Similarity**(vehicle_type_code_a, vehicle_type_code_b)  
foreign: { { vehicle_type_code_a }, { vehicle_type_code_b } }  
candidate: { { vehicle_type_code_a, vehicle_type_code_b } }  
primary: { vehicle_type_code_a, vehicle_type_code_b }  

## **Light**(code, seat_count, door_count, fuel_type)  
foreign: { { code } }  
candidate: { { code } }  
primary: { code }  

## **Heavy**(code, weight, passenger_count)  
foreign: { { code } }  
candidate: { { code } }  
primary: { code }  
