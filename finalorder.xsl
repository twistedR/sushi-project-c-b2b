<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Order for <xsl:value-of select="/order/@order_date"/></title>
        <style>
          .container{
            width: 80%;
            margin:0 auto;
          }
	  thead{
	    font-weight:bold;
	  }
        </style>
        
      </head>
      <body>
        <div class="container">
	  <h1 style="text-align:center">Final Order Report generated for: <xsl:value-of select="/order/@order_date"/></h1>	
          <table style="width:100%" border="1">
            <thead>
              <tr>
                <td>Item Number</td>
                <td>Supplier</td>
                <td>Quote</td>
                <td>Quantity</td>
                <td>ConfirmationNumber</td>
              </tr>
            </thead>
            <tbody>
              <xsl:apply-templates select="order/items/item"/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="items/item">
    <tr>
      <td><xsl:value-of select="./itemNumber"/></td>
      <td><xsl:value-of select="./supplier"/></td>
      <td>$<xsl:value-of select="format-number(./Quote, '#.00')"/></td>
      <td><xsl:value-of select="./quantity"/></td>
      <td><xsl:value-of select="./confirmationNumber"/></td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
