<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:adr="http://viser.edu.rs/ISIT">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />

  <xsl:template match="adr:Adresar">
    <Adresar xmlns="http://viser.edu.rs/ISIT"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://viser.edu.rs/ISIT adresar.xsd">

      <xsl:for-each select="adr:Osoba">
        <Osoba JMBG="{@JMBG}">
          <xsl:copy-of select="adr:Puno_Ime"></xsl:copy-of>
          <xsl:copy-of select="adr:Datum_Rodjenja"></xsl:copy-of>
          <Adresa tip="{adr:Adresa/@tip}" ulica="{adr:Adresa/adr:Ulica}" broj="{adr:Adresa/adr:Broj}" grad="{adr:Adresa/adr:Grad}">
            <Drzava>
              <xsl:copy-of select="adr:Adresa/adr:Drzava"></xsl:copy-of>
            </Drzava>
          </Adresa>
          <xsl:copy-of select ="adr:Telefon"></xsl:copy-of>
          <xsl:for-each select="adr:Email">
            <xsl:copy-of select="."></xsl:copy-of>
          </xsl:for-each>
        </Osoba>
      </xsl:for-each>

      <xsl:for-each select="adr:Kompanija">
        <Kompanija PIB="{@PIB}">
          <xsl:copy-of select="adr:Naziv"></xsl:copy-of >
          <Adresa tip="{adr:Adresa/@tip}" ulica="{adr:Adresa/adr:Ulica}" broj="{adr:Adresa/adr:Broj}" grad="{adr:Adresa/adr:Grad}">
            <Drzava>
              <xsl:copy-of select ="adr:Adresa/adr:Drzava"></xsl:copy-of>
            </Drzava>
          </Adresa>
          <xsl:copy-of select ="adr:Telefon"></xsl:copy-of >
          <xsl:copy-of select="adr:Email"></xsl:copy-of>
        </Kompanija>
      </xsl:for-each>
    </Adresar>
  </xsl:template>
</xsl:stylesheet>