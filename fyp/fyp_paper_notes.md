# Improving Storage System Reliability with Proactive Error Prediction
## Sector error: A bad sector on a hard drive is simply a tiny cluster of storage space — a  sector — of the hard drive that appears to be defective. The sector won’t respond to read or write requests.
## Types of Bad Sectors
- There are two types of bad sectors — often divided into “physical” and “logical” bad sectors or “hard” and “soft” bad sectors.

- A physical — or hard — bad sector is a cluster of storage on the hard drive that’s physically damaged. The hard drive’s head may have touched that part of the hard drive and damaged it, some dust may have settled on that sector and ruined it, a solid-state drive’s flash memory cell may have worn out, or the hard drive may have had other defects or wear issues that caused the sector to become physically damaged. This type of sector cannot be repaired.

- A logical — or soft — bad sector is a cluster of storage on the hard drive that appears to not be working properly. The operating system may have tried to read data on the hard drive from this sector and found that the error-correcting code (ECC) didn’t match the contents of the sector, which suggests that something is wrong. These may be marked as bad sectors, but can be repaired by overwriting the drive with zeros — or, in the old days, performing a low-level format. Windows’ Disk Check tool can also repair such bad sectors.

## SMART(HHD)
**SMART 5**: Count of reallocated sectors. When a read or a write operation on a sector fails, the drive will mark the sector as bad and remap (reallocate) it to a spare sector on disk.

**SMART 187**: The number of read errors that could not be recovered using hardware ECC.

**SMART 196**: The total count of attempts to transfer data from reallocated sectors to a spare area. Unsuccessful attempts are counted as well as successful.

**SMART 197**: Count of ”unstable” sectors. Some drives mark a sector as “unstable” following a failed read, and remap it only after waiting for a while to see whether the data can be recovered in a subsequent read or when it gets overwritten.

We begin by asking how common sector errors are on the Backblaze drives, since the most recent numbers in the literature [4] are based on data collected more than a decade ago. Table 1 shows, for the most common drive models at Backblaze, the fraction of disk drives and the fraction of drive days that are affected by any of the events corresponding to the 5 SMART parameters above.

We observe that the fraction of drives affected by **sector errors**(**SMART 5**) is significant: for two of the models 11% and 25%, respectively, of their population have experienced at least one reallocated sector. We also note that these numbers are significantly higher than the averages re- ported in previous work [4], which was based on data collected in 2004-2006 in Netapp storage systems and saw 3.45% of drives affected by latent sector errors. However, the numbers we see are in line with those re- ported for the three nearline drives in the Netapp study, which ranged from 5–20%.

## Solid State Drives

## Training
- For **random forests** we experimented with different numbers of trees, and settled on using 20 trees for the results included in the paper. We ran experiments with up to 100 trees, but did not see significant improvements
- For **support vector machines**, we experiment with three different kernels: polynomial, lin- ear and radial basis function (RBF) kernels. We also experimented with different degrees for the polynomial kernels.
- For **neural networks**, we include results for a network with 3 layers and 100 nodes.Neural networks with larger numbers of layers are impractical for learn- ing rare events (such as errors or failures) as they require massive amounts of training data. We also experimented with more advanced type of neural networks, such as re- current neural networks, but didn’t find the results to im- prove upon standard neural networks, and hence chose not to include the results. We use the hold-out method to find the best values to adapt the parameters of neural networks, including learning rate, momentum and regu- larization factors. We perform a grid search on these pa- rameters to find the combination that achieves the highest performance.
- For **logistic regression** we experimented with different values for regularization and learning rate. All methods were implemented in Matlab. For SVM we used the LIBSVM library

## Improve Training
- When creating the training data sets, we use majority class under-sampling, a standard technique to improve training in the case of very imbalanced classes, which arises because the original data set has many more instances of negatives (no error), than positives (error). E.g. if we randomly selected training instances from the entire data set, the training set would include only a very small number of instances with errors and hence bias the training process towards non-error predictions. Instead we undersample with different ratios, making sure that at least a certain fraction of training instances are error instances. We experimented with different ratios ranging from 1:1 to 1:10, and found that most ratios, where about 20-60% of all training instances are positives, work well. We have chosen to include the results for a ratio of 1:3.

- When performing the training, we divide the data into 75% training data and 25% testing data for most exper- iments, as is common practice in the machine learning community. Later in the paper, we will also show (Sec- tion 3.3) that much smaller training sets are sufficient. We used the hold-out method for tuning parameters of different algorithms, and chose the values which led to the highest quality predictions.


## why x' = x - x<sub>min</sub> / x<sub>max</sub> - x<sub>min</sub>?
- Rescaling(min-max normalization)
