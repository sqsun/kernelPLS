
This is a Matlab source code of kernelPLS algorithm for feature(gene) selection problem,

=====================================================

Information
-------------------------
Author: S.Q. Sun and Q.K. Peng
Affiliation: Xi'an Jiaotong University
Contact: ssqsxf@stu.xjtu.edu.cn
Release date: April 20, 2014
Version: 1.0
======================================================
main function: main.m
There are two test datasets, namely AMLALL.mat and Lymphoma.mat, were used in our work. 
Others can be download from here: https://github.com/sqsun/kernelPLS-datasets


Fox example:
>> main
How many genes you want to select? 
Please input here: 5 (Enter)
selectedgenes = 

    'M23197_at'    'Y12670_at'    'U50136_rna1_at'    'X95735_at'    'D49950_at'
>>



kernelPLS program is developed by Shiquan Sun (ssqsxf@stu.xjtu.edu.cn)

Contact: ssqsxf@stu.xjtu.edu.cn; qkpeng@xjtu.edu.cn;
released April 24, 2014.

Acknowledge
In the paper, the correlationship betweent two vectors was estimated by kernel mutual information(kernelmi.m), which provided by Mikhail. 
Download free here: http://www.mathworks.com/matlabcentral/fileexchange/30998-kernel-estimate-for--conditional--mutual-information
