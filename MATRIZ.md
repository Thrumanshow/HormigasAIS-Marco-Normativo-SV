# Matriz de Estado y Cumplimiento Regulatorio (HormigasAIS)

> **Aviso de Responsabilidad:** Este documento mapea la alineación técnica y arquitectónica del protocolo e infraestructura de HormigasAIS con el marco normativo vigente en El Salvador. No constituye asesoría legal formal.

---

### Convención de Estados
* **Pendiente:** Requisito identificado, pendiente de gestión administrativa o formalización externa.
* **En trámite:** Expediente o solicitud ingresada ante la autoridad competente (MINEC, ANIA, ACE).
* **Verificado:** Condición o requisito cumplido con evidencia técnica, documental o de publicación comprobable (registro, hash, DOI, repositorio).
* **Exento / Voluntario:** El marco normativo no impone obligación directa sobre la capa de software/SDK, pero la adscripción voluntaria aporta seguridad jurídica.

---

## Matriz de Cumplimiento Normativo

| Requisito | Ley, Norma y Artículo | Estado | Evidencia y Alineación Técnica |
|---|---|---|---|
| **Registro como Desarrollador / Proveedor de IA** | **D.L. 234** (reformado por D.L. 363, 2025), art. 10 y 19 / **Res. ANIA 0001/2025**, art. 12 | **Exento de Registro Obligatorio** *(Inscripción Voluntaria Pendiente)* | **Exención:** Proveedores de modelos de propósito general, SDKs, librerías y middleware de desarrollo (`lbh-sdk`, `@hormigasais/edge-starter`) están exentos del registro obligatorio.<br>**Aspiración Voluntaria:** Registro ante la Agencia Nacional de Inteligencia Artificial (ANIA) para acogerse a la exención de responsabilidad ante uso indebido por terceros (art. 19 D.L. 234). |
| **Salvaguardas de Seguridad, Minimización y Ética** | **D.L. 234**, art. 5 y 19 / **D.L. 143** (*Ley de Ciberseguridad - ACE*) / **Res. ANIA 0001/2025** | **Verificado (Por Diseño)** | **Arquitectura:** Cifrado AES-256, firmas Ed25519 (`id_ed25519_clhq_signing`), aislamiento estricto en sandbox local (`SANDBOX_CUANTICO_ISO`), minimización de datos y privacidad por diseño (*offline-first*).<br>**Documentación:** `GOVERNANCE.md`, `SECURITY_MODEL.md`, `lbh_cert_status.json`. |
| **Incentivos Fiscales en Innovación y Tecnología** | **D.L. 722** (*Ley de Fomento a la Innovación y Manufactura de Tecnologías*) y **D.L. 234** | **Pendiente de Presentar** | Requiere estructuración y presentación de expediente técnico ante el Ministerio de Economía (MINEC) y Hacienda para la emisión del Acuerdo de Calificación formal (exenciones de ISR, IVA y aranceles). |
| **Protección y Tratamiento de Datos Personales** | **D.L. 144** (*Ley para la Protección de Datos Personales - ACE*) / **D.L. 234**, art. 22 | **Verificado (Cero Nube Obligatoria)** | Procesamiento puramente local (*edge computing* en nodo sovereign) sin telemetría ni transmisión forzada a terceros; uso de datos locales y anonimizados en estricto cumplimiento con el principio de minimización. |
| **Depósito Criptográfico e Integridad de Código** | **Res. ANIA 0001/2025**, art. 12, num. 2 (*Sello de Hashes Criptográficos*) | **Verificado** | Publicación de la especificación oficial del protocolo en Zenodo (**DOI: 10.5281/zenodo.19177759**), paquetes verificados en PyPI y npm, y commits firmados criptográficamente por el autor. |
| **Revisión Legal Especializada en El Salvador** | Marco Normativo de IA (ANIA), Ciberseguridad y Protección de Datos (ACE) | **Pendiente** | Validación final o dictamen técnico-legal por un profesional del derecho salvadoreño especializado en el régimen regulatorio tecnológico. |

---

## Notas de Alineación Jurídico-Técnica para la Colonia de Nodos

1. **Exención vs. Registro Voluntario (D.L. 234 / ANIA):**
   * El Decreto 234 y la Resolución 0001/2025 de la ANIA delimitan el registro obligatorio para soluciones finales de IA que tomen decisiones automatizadas de alto impacto. 
   * Dado que HormigasAIS opera como protocolo de comunicación binaria (LBH), middleware y SDK en el borde, califica en la categoría de **herramientas de infraestructura**, estando exenta del registro obligatorio. No obstante, el registro voluntario permite blindar la responsabilidad del desarrollador según el Art. 19 del D.L. 234.

2. **Ciberseguridad y Datos Personales (D.L. 143 y D.L. 144 / ACE):**
   * La Agencia de Ciberseguridad del Estado (ACE) regula tanto el estándar de ciberseguridad (D.L. 143) como el tratamiento de datos personales (D.L. 144). 
   * La filosofía *offline-first* y la ejecución local en hardware ARM64/Edge de HormigasAIS garantizan que los datos no circulen por servidores de terceros, cumpliendo de forma nativa por arquitectura (*Compliance by Design*) con las exigencias del D.L. 144.

3. **Incentivos del D.L. 722 (MINEC / Hacienda):**
   * El D.L. 722 permite acceder a exenciones tributarias de hasta 15 años para el desarrollo de software, inteligencia artificial y manufactura de hardware/embebidos, previa calificación del MINEC.
