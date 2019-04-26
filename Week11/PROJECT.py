from googleplaces import GooglePlaces, types, lang
import urllib.request
import urllib.error
import json
import networkx as nx
import matplotlib.pyplot as plt

API_KEY = 'AIzaSyDtXUOF8QiIB608KLzmSlPZJhHjh81Wrvw'
google_places = GooglePlaces(API_KEY)
centre_of_KHI='Dreamworld Resort, Hotel & Golf Course, Karachi'.replace(' ','+').replace(',','')
endpoint = 'https://maps.googleapis.com/maps/api/directions/json?'

def possibilities(req,centre_of_KHI):
    query_result = google_places.nearby_search(
    location=centre_of_KHI, name=req,
    radius=(3530//2)*1000)
    
    i=1
    for place in query_result.places:
        print(str(i)+')',place.name+'\n\tVicinity: '+place.vicinity)
        print()
        i+=1
    return lst

def lst(req,centre_of_KHI):
    query_result = google_places.nearby_search(
    location=centre_of_KHI, name=req,
    radius=(3530//2)*1000)

    lst=[]
    for place in query_result.places:
        lst.append(place.name)
    return lst

def html_cleaner(html_instructions):
    stack = []
    i=0
    while i<(len(html_instructions)):
        if html_instructions[i]!='>':
            if html_instructions[i]=="&":
                html_instructions=html_instructions[:i-1]+html_instructions[i+1:]
                i+=3
            else:
                stack.append(html_instructions[i])
        else:
            for j in range(len(stack),stack.index('<'),-1):
                stack.pop()
        i+=1
        
    a=''
    for i in stack:
        a+=i
    return a

def singleroute(steps):
    a=0
    interm_locations={}
    for i in steps:
        location=[]
        for j in i:
            l={}
            if j=='html_instructions':                    
                l['direction']=html_cleaner(i[j])
                location.append(l)
            else:
                if j!='polyline':#removed polyline from steps
                    l[j]=i[j]
                    location.append(l)
        interm_locations[a]=location
        a+=1
    y=""
    for i in interm_locations:
        x=interm_locations[i][0]['distance']['text']
        y+=str(interm_locations[i][3]['direction'])+' ( '+x+" ).\n"
    return y[:-1]

## INPUT:
di=(input('Do you want directions as well? (reply with "yes" or "no" only)')).casefold()
def ask():
    starting_point=input("Where are you starting from? ")
    return starting_point
starting_point=ask()
print("Did you mean: ")
possibilities(starting_point,centre_of_KHI)
while len(lst(starting_point,centre_of_KHI))==0:
    print('"Not found, try again."')
    starting_point=ask()
    if len(lst(starting_point,centre_of_KHI))>0:
        print("Did you mean: ")
        possibilities(starting_point,centre_of_KHI)
select=int(input("Enter Selection: "))
print("Confirmed.")
locations=[lst(starting_point,centre_of_KHI)[select-1]]
a=' '
while True:
    print()
    a=input('Enter Location: (Press Enter if no more locations are to be entered) ')
    if len(a)==0:
        break
    print("Did you mean: ")
    possibilities(a,centre_of_KHI)
    if len(lst(a,centre_of_KHI))>0:
        select=int(input("Enter Selection: "))
        print("Confirmed.")
        locations.append(lst(a,centre_of_KHI)[select-1])
    else:
        print("Not found, try again.")
starting_point=locations[0]
## SETTING UP GRAPH:

def makegraph(points,starting_point,endpoint,api_key):
    G={}
    for i in points:
        lst=[]
        origin = i.replace(" ","+").replace(',','').replace('،','')
        for j in points:
            if i!=j and j!=starting_point:
                destination = j.replace(" ","+").replace(',','').replace('،','')
                nav_request = 'origin='+origin+'&destination='+destination+'&key='+api_key
                request = endpoint + nav_request
                response = urllib.request.urlopen(request).read()
                directions = json.loads(response)
                a=directions['status']
                if a=='OK':
                    lst1=[j,float(directions['routes'][0]['legs'][0]['distance']['text'][:-3].replace(',',''))]
                    lst.append(lst1)
                else:
                    return 'Location '+j+' unavailable, please enter a more precise location.'
        G[i]=lst
    return G
G=makegraph(locations,starting_point,endpoint,API_KEY)
def thegraphdirections(G):
    G1={}
    for i in G:
        origin = i.replace(" ","+").replace(',','').replace('،','')
        lst=[]
        for j in G[i]:
            destination = j[0].replace(" ","+").replace(',','').replace('،','')
            nav_request = 'origin='+origin+'&destination='+destination+'&key='+API_KEY
            request = endpoint + nav_request
            response = urllib.request.urlopen(request).read()
            directions = json.loads(response)

            steps = directions['routes'][0]['legs'][0]['steps']
            lst1=[j[0],singleroute(steps)]
            lst.append(lst1)
        G1[i]=lst
    return G1
G1=thegraphdirections(G)


## APPLY ALGORITHM FOR FINAL ROUTE MAPPING:


def algorithm(G,starting_point):
    visited=[starting_point]
    edgelist=[]
    while len(visited)!=len(G):
        minn=5000
        for i in G[visited[-1]]:
            if i[0] not in visited and i[1]<minn:
                minn=i[1]
                dusted=i[0]
        edgelist.append((visited[-1],dusted,minn))
        visited.append(dusted)
        
    return edgelist
z=algorithm(G,starting_point)
def direct(G,edgelist):
    lst=[]
    for i in edgelist:
        for j in G[i[0]]:
            if j[0]==i[1]:
                lst.append((i[0],j[0],j[1]))
    return lst
a=direct(G1,z)

if di=='yes':
    for i in  a:
        h='*Directions from '+i[0]+' to '+i[1]+'*'
        print (len(h)*'*')
        print ('\n'+h+'\n')
        print (len(h)*'*')
        print (i[2])


##GUI:
G=nx.DiGraph()

G.add_weighted_edges_from(z)
pos=nx.spring_layout(G)
nx.draw(G,pos,with_labels=True, font_weight="bold")
nx.draw_networkx_edge_labels(G,pos)
plt.show()


## PRINT OUTPUT AND SHOW MAP
