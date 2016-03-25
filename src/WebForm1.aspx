<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication4.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="jquery-1.9.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false&v=3&libraries=geometry"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btn").click(function () {
                var lat = document.getElementById('lat').value;
                var long = document.getElementById('lon').value;
                var lat1 = document.getElementById('Lat1').value;
                var long1 = document.getElementById('Lon1').value;
                var lat2 = document.getElementById('Lat2').value;
                var long2 = document.getElementById('Lon2').value;
                var lat3 = document.getElementById('Lat3').value;
                var long3 = document.getElementById('Lon3').value;
                var lat4 = document.getElementById('Lat4').value;
                var long4 = document.getElementById('Lon4').value;
                var lat5 = document.getElementById('Lat5').value;
                var long5 = document.getElementById('Lon5').value;
                var lat6 = document.getElementById('Lat6').value;
                var long6 = document.getElementById('Lon6').value;
                var lat7 = document.getElementById('Lat7').value;
                var long7 = document.getElementById('Lon7').value;
                var lat8 = document.getElementById('Lat8').value;
                var long8 = document.getElementById('Lon8').value;
                var lat9 = document.getElementById('Lat9').value;
                var long9 = document.getElementById('Lon9').value;
                var lat10 = document.getElementById('Lat10').value;
                var long10 = document.getElementById('Lon10').value;

                



                var d1 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat/1000, long/1000), new google.maps.LatLng(lat1/1000, long1/1000)).toFixed(1);
                var d2 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat/1000, long/1000), new google.maps.LatLng(lat2/1000, long2/1000)).toFixed(1);
                var d3 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat3 / 1000, long3 / 1000)).toFixed(1);
                var d4 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat4 / 1000, long4 / 1000)).toFixed(1);
                var d5 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat5 / 1000, long5 / 1000)).toFixed(1);
                var d6 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat6 / 1000, long6 / 1000)).toFixed(1);
                var d7 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat7 / 1000, long7 / 1000)).toFixed(1);
                var d8 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat8 / 1000, long8 / 1000)).toFixed(1);
                var d9 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat9 / 1000, long9 / 1000)).toFixed(1);
                var d10 = google.maps.geometry.spherical.computeDistanceBetween(new google.maps.LatLng(lat / 1000, long/1000), new google.maps.LatLng(lat10 / 1000, long10 / 1000)).toFixed(1);

               
                
                var locations = [
                              [lat, long,0],
                             [lat1, long1, d1], [lat2, long2, d2], [lat3, long3, d3], [lat4, long4, d4], [lat5, long5, d5], [lat6, long6, d6], [lat7, long7, d7], [lat8, long8, d8], [lat9, long9, d9], [lat10, long10, d10]];
                
                var j, k, temp1, temp2, temp3;

                for (j = 1; j < locations.length; j++) {
                    for (k = j+1; k < locations.length; k++) {
                        if (locations[j][2] > locations[k][2]) {
                            temp1 = locations[j][2];
                            temp2 = locations[j][1];
                            temp3 = locations[j][0];
                            locations[j][2] = locations[k][2];
                            locations[j][1] = locations[k][1];
                            locations[j][0] = locations[k][0];
                            locations[k][2] = temp1;
                            locations[k][1] = temp2;
                            locations[k][0] = temp3;
                        }

                    }
                }
                
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 10,
                    center: new google.maps.LatLng(lat, long),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[0][0], locations[0][1]),
                    map: map, icon: image,

                });
                
                var marker, i;

                for (i = 1; i < locations.length; i++) {
                    var image = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld='+(i)+'|FE6256|000000';
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][0], locations[i][1]),
                        map: map,icon:image,
                        
                    }); 
                }

                   
            });

            $("#btn2").click(function () {

                var dl = [[lat1, long1, d1], [lat2, long2, d2], [lat3, long3, d3], [lat4, long4, d4], [lat5, long5, d5], [lat6, long6, d6], [lat7, long7, d7], [lat8, long8, d8], [lat9, long9, d9], [lat10, long10, d10]];
                var k,j,temp1,temp2,temp3;
                for (j = 0; j < dl.length; j++) {
                    for(k=0;k<dl.length;k++)
                    {
                        if(dl[0][j][2]<dl[0][k][2])
                        {
                            temp1=dl[0][j][2];
                            temp2=dl[0][j][1];
                            temp3=dl[0][j][0];
                            dl[0][j][2]=dl[0][k][2];
                            dl[0][j][1]=dl[0][k][1];
                            dl[0][j][0]=dl[0][k][0];
                            dl[0][k][2] = temp1;
                            dl[0][k][1]=temp2;
                            dl[0][k][0]=temp3;
                        }
                       }
                }

                var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
                marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[0][0], locations[0][1]),
                    map: map, icon: image,

                });
                
                var marker, l;

                for ( l= 1; l < dl.length; l++) {
                    var image = 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld='+(i)+'|FE6256|000000';
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(dl[l][0], dl[l][1]),
                        map: map,icon:image,
                        
                    });
                }


            });

        });
   </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td colspan="2">Add a Starting Location
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="lat" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="lon" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Add First Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon1" runat="server"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Second Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Third Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Four Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon4" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Fifth Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat5" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon5" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add sixth Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat6" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon6" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Seventh Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat7" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon7" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Eighth Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat8" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon8" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Nineth Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat9" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon9" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        
                        <br />
                        Add Tenth Location In Google Maps
                    </td>
                </tr>
                <tr>
                    <td>Latitude:
                    </td>
                    <td>
                        <asp:TextBox ID="Lat10" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Longitude :
                    </td>
                    <td>
                        <asp:TextBox ID="Lon10" runat="server"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    
                    <td>
                        
                        <input id="btn" type="button" value="Search Place" />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                    </td>

                </tr>
                 <tr>
                    
                    <td>
                       
                        <input id="btn2" type="button" value="See Place" />

                    </td>

                </tr>

            </table>
            
        </div>
        <div id="map" style="height: 500px; width: 500px">
        </div>
    </form>

</body>
</html>
