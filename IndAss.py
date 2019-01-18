import json 
import csv

header = ['type_of_violence', 'year', 'longitude', 'latitude']
with open ('india.json', encoding='utf8') as file: 
    india_conflicts= json.load(file) 
with open ('IndiaConflict.csv', 'w', encoding='utf8') as file: 
    writer= csv.DictWriter(file, fieldnames=header, lineterminator='\n', delimiter=',', extrasaction='ignore')
    writer.writeheader()
    for conflict in india_conflicts: 
        writer.writerow(conflict)
#print(india_conflicts)  

header = ['type_of_violence', 'year','longitude', 'latitude']
with open ('russia.json') as file: #extract type of violence 
   russia_conflicts= json.load(file) 
with open ('RussiaConflict.csv', 'w', encoding='utf8') as file: 
    writer= csv.DictWriter(file, fieldnames=header, lineterminator='\n', delimiter=',', extrasaction='ignore')
    writer.writeheader()
    for conflictR in russia_conflicts: 
        writer.writerow(conflictR)

#print(russia_conflicts)  

'''
     extract type of violence
    for key in type_of_violence.keys():
        if key not in header: 
            header.append(key)
'''

with open ('populations_lined.json') as file: 
    population_india = json.load(file)

with open ('IndianPopulation.csv', 'w', encoding= 'utf8') as file: 
    file.write('year,population \n')
    for year, population in population_india['India'].items():
        file.write(f'{year},{population}\n')

with open ('RussianPopulation.csv', 'w', encoding= 'utf8') as file: 
    file.write('year,population \n')
    for year, population in population_india['Russian Federation'].items():
        file.write(f'{year},{population}\n')

