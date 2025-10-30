The US SAFR IG includes practical use cases demonstrating its application across various levels of healthcare resource management. These use cases highlight the framework’s ability to address immediate and strategic challenges. For more context, see [Reporting Scenarios](specification.html).

### United States Situational Awareness for Facilitation of Response Measure Reporting Use Cases

#### Use Case #1: Real-Time Bed Capacity and Staffing Needs During a Flu Surge

**Scenario**
During a severe flu season, hospitals in a specific jurisdiction experience a high influx of patients with respiratory illnesses, straining bed capacity and staffing resources.

**Facility/Hospital-Level Use**

**1. Bed and Staffing Allocation**
- Hospitals use US SAFR to report real-time bed occupancy and availability every 15 minutes, categorized by bed type.
- Hospital administrators leverage this data to monitor capacity and prioritize staffing where it is most urgently needed.

**2. Resource Allocation**
- By analyzing near real-time bed occupancy and patient influx data, hospitals coordinate with temporary staffing agencies or reallocate internal staff to address shortages effectively.

**Jurisdiction-Level Use**

**1. Capacity Tracking Across Hospitals**
- Local health departments use US SAFR to monitor bed and ICU capacity across multiple facilities, identifying hospitals under the greatest strain.

**2. Cross-Jurisdictional Resource Support**
- Capacity data sharing enables neighboring jurisdictions to coordinate patient transfers and resource reallocation, easing pressure on overwhelmed facilities.

**Federal-Level Use**

**1. National Monitoring and Resource Allocation**
- Federal agencies, including the CDC, receive aggregated data to identify high-occupancy states and allocate emergency resources accordingly.

**2. Trend Analysis and Early Warning System**
- Analysis of surge data enables early detection of trends, guiding preventative measures like vaccination campaigns or public advisories in affected areas.

#### Use Case #2: Emergency Response Coordination for Natural Disaster Evacuations

**Scenario**
In response to an approaching hurricane on the Texas coastline, state emergency management and health departments plan for hospital evacuations and patient redistribution to inland facilities.

**Facility/Hospital-Level Use**

**1. Resource Mobilization and Preparedness**
- Coastal hospitals report real-time bed availability and anticipated needs using US SAFR, enabling inland hospitals to prepare and allocate space in advance.

**2. Evacuation Logistics**
- Real-time data supports collaboration with EMS and transport services, identifying available ICU and specialty care beds at inland facilities for safe patient transfers.

**Jurisdiction-Level Use**

**1. Cross-Hospital Coordination**
- State health departments monitor bed capacity across facilities and direct ambulances to locations with adequate resources.

**2. Resource Allocation Across Jurisdictions**
- Aggregated data informs the deployment of critical supplies, ensuring inland hospitals are prepared to receive evacuees.

**Federal-Level Use**

**1. Emergency Support and Resource Allocation**
- Federal agencies assess regional capacity and deploy FEMA medical personnel or National Guard resources as needed.

**2.Unified Federal and State Response**
- US SAFR facilitates coordinated federal-state responses, optimizing resource distribution and avoiding redundancies.

#### Bed Inclusion Criteria

For all bed censuses and counts, the following bed types should be <u>included</u>:
1. All inpatient staffed and unblocked beds
2. Observation beds

#### Bed Exclusion Criteria

For all bed censuses and counts, the following bed types should be <u>excluded</u>:
1. Virtual beds or locations in the EMR that are not physical spaces (i.e., beds used for interoperative phase of care or in certain operative settings or virtual staging areas for admissions.)
2. Beds no longer in use, even in case of surge
3. Blocked beds (i.e., beds blocked due to logistical or maintenance challenges, staffing restrictions, isolation, etc.) 


#### Unit Inclusion Criteria

- ED    Emergency department
- ICU   Intensive care unit
- LOC   Level of care
- MT/MS Medicine telemetry/medicine surgery acute care bed
- NICU  Neonatal intensive care unit
- NP    Negative pressure
- OB    Obstetrics
- OBS   Observation
- PCU   Progressive care unit
- Peds  Pediatric
- PICU  Pediatric intensive care unit
- Psych Psychiatric
- Rehab Rehabilitation

#### Bed Capacity Example
<table class="grid">
   <col style="width:20%" />
   <tbody>
      <tr>
         <td style="column-width:30%">
            <a href="Measure-BedCapacityMeasure.html" title="Measure/BedCapacityMeasure">Measure - Bed Capacity Measure
               Example</a>
         </td>
         <td>
            <p>Example of a bed capacity measure for ICU, ED, and Pediatric beds for NHSN reporting.</p>
         </td>
      </tr>
      <tr>
         <td style="column-width:30%">
            <a href="Library-BedCapacityLibrary.html" title="Library/BedCapacityLibrary">Library - Library of Bed
               Capacity Measure Example</a>
         </td>
         <td>
            <p>This library contains CQL logic for evaluating structural measures related to bed capacity reporting
               capabilities.</p>
         </td>
      </tr>
      <tr>
         <td style="column-width:30%">
            <a href="Bundle-BedCapacityMeasureBundle.html" title="Bundle/BedCapacityMeasureBundle">Bundle - Bed Capacity
               Measure Bundle Example</a>
         </td>
         <td>
            <p>This Bundle resource is an example of a Bed Capacity Measure Bundle.</p>
         </td>
      </tr>
      <tr>
         <td style="column-width:30%">
            <a href="MeasureReport-BedCapacityMeasureReport.html"
               title="MeasureReport/BedCapacityMeasureReport">MeasureReport - Bed Capacity MeasureReport Example</a>
         </td>
         <td>
            <p>Example MeasureReport for NHSN bed capacity monitoring showing ICU, ED, and Pediatric bed capacity</p>
         </td>
      </tr>      
      <tr>
         <td style="column-width:30%">
            <a href="Bundle-HospitalBedCapacityReportBundle.html" title="Bundle/HospitalBedCapacityReportBundle">Bundle
               - Bed Capacity Report Bundle Example</a>
         </td>
         <td>
            <p>Bundle containing a measure report and all referenced resources for NHSN bed capacity reporting.</p>
         </td>
      </tr>
   </tbody>
</table>