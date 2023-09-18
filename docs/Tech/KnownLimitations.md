---
hide:
  - toc
---
# Limitations

+ OnGuard doesn’t model doors; instead it models readers. But XProtect Access requires doors. The OnGuard plugin creates virtual doors based on reader properties (i.e. panel id, panel address, reader number, etc). The virtual door names are taken from the first reader that has a non-empty display name. If that reader is named “reader 1”, that’s what the door is named. This may not be intuitive when viewed in the XProtect Management Client or Smart Client applications’ hardware hierarchy

+ The XProtect Access instance in the Management Client can fail to load after the Event Server starts or is restarted if the OnGuard XProtect Access Service on the OnGuard server isn't started and running. Symptoms of this issue include:
>
> + Existing XProtect Access instance disappears from Management Client
> + Creation of new XProtect Access instance is not allowed
> + NullReferenceException log entries appear in the Event Server log file
>

